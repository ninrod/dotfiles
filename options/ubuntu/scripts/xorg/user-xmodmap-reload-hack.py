#!/usr/bin/env python
# Adapted from Andrey Tataranovich script www.tataranovich.com/public/scripts/xkbmapd.py
# to load the user .Xmodmap file on 1) start, 2) resume and 3) layout switch
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

import os
import sys
import fcntl
import dbus
import gobject
import time
from dbus.mainloop.glib import DBusGMainLoop

# Fork to background
if os.fork():
	sys.exit(0)

xmodmap = os.path.expanduser('~/.Xmodmap')
if not os.path.isfile(xmodmap):
	print('File not found: ' + xmodmap)
	sys.exit(1)

# Try to detect if another instance already running
lock = open(os.path.realpath(xmodmap), 'r')
try:
	fcntl.flock(lock, fcntl.LOCK_EX|fcntl.LOCK_NB)
except:
	print('Unable to lock file: ' + xmodmap + '. Maybe another instance already running')
	sys.exit(1)

# DBus init
dbus.mainloop.glib.DBusGMainLoop(set_as_default = True)
system_bus = dbus.SystemBus()
session_bus = dbus.SessionBus()

# The command xmodmap ~/xmodmap
def do():
	command = 'xmodmap ' + xmodmap
	if os.path.isfile(xmodmap):
		time.sleep(5)
		os.system(command)

# Get the object path for the current active session
def get_current_session_path():
	seat = system_bus.get_object('org.freedesktop.login1', '/org/freedesktop/login1/seat/' + os.environ['XDG_SEAT'])
	active_session = seat.Get('org.freedesktop.login1.Seat', 'ActiveSession', dbus_interface='org.freedesktop.DBus.Properties')
	session_obj_path = active_session[1]
	return session_obj_path

# Store my session path so we can compare later
my_session = get_current_session_path()

# The event handlers
def handle_resume(arg):
	if arg == False: # PrepareForSleep returns false if resuming
		do()

def handle_session(*args):
	if my_session == get_current_session_path():
		do()

# Debugme: if you have the applet active, when you resume or change sessions, 
# this layout switch handle is called too... so we are loading the xmodmap 2 times!
# But we need the other handles because the applet can be disabled...
def handle_layout_switch(arg):
        if arg == "com.canonical.indicator.keyboard":
		do()

# Why not do at the start?
do()

# The signals
system_bus.add_signal_receiver(handle_resume, signal_name='PrepareForSleep', dbus_interface='org.freedesktop.login1.Manager')

system_bus.add_signal_receiver(handle_session, signal_name='PropertiesChanged', dbus_interface='org.freedesktop.DBus.Properties', bus_name='org.freedesktop.login1', path='/org/freedesktop/login1/seat/' + os.environ['XDG_SEAT'])

session_bus.add_signal_receiver(handle_layout_switch, signal_name='ReSync', dbus_interface='com.canonical.Unity.Panel.Service')

# Loop baby
loop = gobject.MainLoop()
loop.run()
