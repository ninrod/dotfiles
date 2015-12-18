class Test {
  int var = 0;

  int foo2(Foo bar)
  {
    return 42;
    return 42;
    return 42;
  }

  int foo3(Foo bar)
  {
    return 42;

    if (true)
    {
      return 42;
    }

    return 42;
  }

  String bar(Foo bar)
  {
    return 42;
    return 42;
    return 42;
  }

  String bar(Foo bar) {
    return 42;
    return 42;
    return 42;
  }

  int blah(Foo bar,
           Foo baz)
  {
    return 42;
    return 42;
    return 42;
  }

  private List<String> baz(Foo bar,
                           Foo baz) {
    return 42;
    return 42;
    return 42;
  }

  int qux(
      Foo bar,
      Foo baz
  )
  {
    return 42;
    return 42;
    return 42;
  }

  int qux(
      Foo bar,
      Foo baz
  ) {
    return 42;
    return 42;
    return 42;
  }

  int foo()
  {
  }

  int foo() {
  }
}
