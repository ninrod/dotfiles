let Foo = 0
function Foo()
  return 1
  return 2
  return 3
endfunction

  let Bar = 0
  function Bar()
    return 4
    return 5
    return 6
  endfunction

function! Baz()
endfunction

describe 'outer'
  describe 'inner 1'
    before
      new
      function! b:.foo()
        ...
      endfunction
    end

    after
      close!
    end

    it '...'
      ...
    end
  end

  describe 'inner 2'
    describe '...'
    end

    before
    end

    after
    end

    it '...'
    end
  end
end
