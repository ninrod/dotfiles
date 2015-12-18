source t/helpers/setup.vim

describe '<Plug>(textobj-function-a)'
  before
    new
    setfiletype vim
    call PasteSampleCode('vim')
  end

  after
    close!
  end

  describe 'in a plain Vim script'
    it 'fails if the cursor is not in a function'
      Expect Select(1, 'af') ==# ['v', 1, 1]
      Expect Select(7, 'af') ==# ['v', 7, 7]
    end

    it 'selects the function under the cursor'
      " At the first line.
      Expect Select(2, 'af') ==# ['V', 2, 6]

      " At a middle line.
      Expect Select(4, 'af') ==# ['V', 2, 6]

      " At the last line.
      Expect Select(6, 'af') ==# ['V', 2, 6]
    end

    it 'recognizes a function even if it is deeply indented'
      Expect Select(11, 'af') ==# ['V', 9, 13]
    end

    it 'can select a function without code'
      Expect Select(15, 'af') ==# ['V', 15, 16]
      Expect Select(16, 'af') ==# ['V', 15, 16]
    end
  end

  describe 'in a vspec test script'
    it 'can select an outer :describe block'
      Expect Select(18, 'af') ==# ['V', 18, 49]
      Expect Select(35, 'af') ==# ['V', 18, 49]
      Expect Select(49, 'af') ==# ['V', 18, 49]
    end

    it 'can select an inner :describe block'
      Expect Select(19, 'af') ==# ['V', 19, 34]
      Expect Select(26, 'af') ==# ['V', 19, 34]
      Expect Select(30, 'af') ==# ['V', 19, 34]
      Expect Select(34, 'af') ==# ['V', 19, 34]
    end

    it 'can select a :before block'
      Expect Select(20, 'af') ==# ['V', 20, 25]
      Expect Select(21, 'af') ==# ['V', 20, 25]
      Expect Select(25, 'af') ==# ['V', 20, 25]
    end

    it 'can select an :after block'
      Expect Select(27, 'af') ==# ['V', 27, 29]
      Expect Select(28, 'af') ==# ['V', 27, 29]
      Expect Select(29, 'af') ==# ['V', 27, 29]
    end

    it 'can select an :it block'
      Expect Select(31, 'af') ==# ['V', 31, 33]
      Expect Select(32, 'af') ==# ['V', 31, 33]
      Expect Select(33, 'af') ==# ['V', 31, 33]
    end

    it 'can select a function in any block'
      Expect Select(22, 'af') ==# ['V', 22, 24]
      Expect Select(23, 'af') ==# ['V', 22, 24]
      Expect Select(24, 'af') ==# ['V', 22, 24]
    end

    it 'can select an empty :describe block'
      Expect Select(37, 'af') ==# ['V', 37, 38]
      Expect Select(38, 'af') ==# ['V', 37, 38]
    end

    it 'can select an empty :before block'
      Expect Select(40, 'af') ==# ['V', 40, 41]
      Expect Select(41, 'af') ==# ['V', 40, 41]
    end

    it 'can select an empty :after block'
      Expect Select(43, 'af') ==# ['V', 43, 44]
      Expect Select(44, 'af') ==# ['V', 43, 44]
    end

    it 'can select an empty :it block'
      Expect Select(46, 'af') ==# ['V', 46, 47]
      Expect Select(47, 'af') ==# ['V', 46, 47]
    end
  end
end

describe '<Plug>(textobj-function-i)'
  before
    new
    setfiletype vim
    call PasteSampleCode('vim')
  end

  after
    close!
  end

  describe 'in a plain Vim script'
    it 'fails if the cursor is not in a function'
      Expect Select(1, 'if') ==# ['v', 1, 1]
      Expect Select(7, 'if') ==# ['v', 7, 7]
    end

    it 'selects the content of the function under the cursor'
      " At the first line.
      Expect Select(2, 'if') ==# ['V', 3, 5]

      " At a middle line.
      Expect Select(4, 'if') ==# ['V', 3, 5]

      " At the last line.
      Expect Select(6, 'if') ==# ['V', 3, 5]
    end

    it 'recognizes a function even if it is deeply indented'
      Expect Select(11, 'if') ==# ['V', 10, 12]
    end

    it 'cannot select a function without code'
      Expect Select(15, 'if') ==# ['v', 15, 15]
      Expect Select(16, 'if') ==# ['v', 16, 16]
    end
  end

  describe 'in a vspec test script'
    it 'can select an outer :describe block'
      Expect Select(18, 'if') ==# ['V', 19, 48]
      Expect Select(35, 'if') ==# ['V', 19, 48]
      Expect Select(49, 'if') ==# ['V', 19, 48]
    end

    it 'can select an inner :describe block'
      Expect Select(19, 'if') ==# ['V', 20, 33]
      Expect Select(26, 'if') ==# ['V', 20, 33]
      Expect Select(30, 'if') ==# ['V', 20, 33]
      Expect Select(34, 'if') ==# ['V', 20, 33]
    end

    it 'can select a :before block'
      Expect Select(20, 'if') ==# ['V', 21, 24]
      Expect Select(21, 'if') ==# ['V', 21, 24]
      Expect Select(25, 'if') ==# ['V', 21, 24]
    end

    it 'can select an :after block'
      Expect Select(27, 'if') ==# ['V', 28, 28]
      Expect Select(28, 'if') ==# ['V', 28, 28]
      Expect Select(29, 'if') ==# ['V', 28, 28]
    end

    it 'can select an :it block'
      Expect Select(31, 'if') ==# ['V', 32, 32]
      Expect Select(32, 'if') ==# ['V', 32, 32]
      Expect Select(33, 'if') ==# ['V', 32, 32]
    end

    it 'can select a function in any block'
      Expect Select(22, 'if') ==# ['V', 23, 23]
      Expect Select(23, 'if') ==# ['V', 23, 23]
      Expect Select(24, 'if') ==# ['V', 23, 23]
    end

    it 'cannot select an empty :describe block'
      Expect Select(37, 'if') ==# ['v', 37, 37]
      Expect Select(38, 'if') ==# ['v', 38, 38]
    end

    it 'cannot select an empty :before block'
      Expect Select(40, 'if') ==# ['v', 40, 40]
      Expect Select(41, 'if') ==# ['v', 41, 41]
    end

    it 'cannot select an empty :after block'
      Expect Select(43, 'if') ==# ['v', 43, 43]
      Expect Select(44, 'if') ==# ['v', 44, 44]
    end

    it 'cannot select an empty :it block'
      Expect Select(46, 'if') ==# ['v', 46, 46]
      Expect Select(47, 'if') ==# ['v', 47, 47]
    end
  end
end

describe '<Plug>(textobj-function-A)'
  before
    new
    setfiletype vim
    call PasteSampleCode('vim')
  end

  after
    close!
  end

  describe 'in a plain Vim script'
    it 'fails if the cursor is not in a function'
      Expect Select(1, 'aF') ==# ['v', 1, 1]
      Expect Select(7, 'aF') ==# ['v', 7, 7]
    end

    it 'selects the function under the cursor'
      " At the first line.
      Expect Select(2, 'aF') ==# ['V', 2, 7]

      " At a middle line.
      Expect Select(4, 'aF') ==# ['V', 2, 7]

      " At the last line.
      Expect Select(6, 'aF') ==# ['V', 2, 7]
    end

    it 'recognizes a function even if it is deeply indented'
      Expect Select(11, 'aF') ==# ['V', 9, 14]
    end

    it 'can select a function without code'
      Expect Select(15, 'aF') ==# ['V', 15, 17]
      Expect Select(16, 'aF') ==# ['V', 15, 17]
    end
  end

  describe 'in a vspec test script'
    it 'can select an outer :describe block'
      Expect Select(18, 'aF') ==# ['V', 17, 49]
      Expect Select(35, 'aF') ==# ['V', 17, 49]
      Expect Select(49, 'aF') ==# ['V', 17, 49]
    end

    it 'can select an inner :describe block'
      Expect Select(19, 'aF') ==# ['V', 19, 35]
      Expect Select(26, 'aF') ==# ['V', 19, 35]
      Expect Select(30, 'aF') ==# ['V', 19, 35]
      Expect Select(34, 'aF') ==# ['V', 19, 35]
    end

    it 'can select a :before block'
      Expect Select(20, 'aF') ==# ['V', 20, 26]
      Expect Select(21, 'aF') ==# ['V', 20, 26]
      Expect Select(25, 'aF') ==# ['V', 20, 26]
    end

    it 'can select an :after block'
      Expect Select(27, 'aF') ==# ['V', 27, 30]
      Expect Select(28, 'aF') ==# ['V', 27, 30]
      Expect Select(29, 'aF') ==# ['V', 27, 30]
    end

    it 'can select an :it block'
      Expect Select(31, 'aF') ==# ['V', 30, 33]
      Expect Select(32, 'aF') ==# ['V', 30, 33]
      Expect Select(33, 'aF') ==# ['V', 30, 33]
    end

    it 'can select a function in any block'
      Expect Select(22, 'aF') ==# ['V', 22, 24]
      Expect Select(23, 'aF') ==# ['V', 22, 24]
      Expect Select(24, 'aF') ==# ['V', 22, 24]
    end

    it 'can select an empty :describe block'
      Expect Select(37, 'aF') ==# ['V', 37, 39]
      Expect Select(38, 'aF') ==# ['V', 37, 39]
    end

    it 'can select an empty :before block'
      Expect Select(40, 'aF') ==# ['V', 40, 42]
      Expect Select(41, 'aF') ==# ['V', 40, 42]
    end

    it 'can select an empty :after block'
      Expect Select(43, 'aF') ==# ['V', 43, 45]
      Expect Select(44, 'aF') ==# ['V', 43, 45]
    end

    it 'can select an empty :it block'
      Expect Select(46, 'aF') ==# ['V', 45, 47]
      Expect Select(47, 'aF') ==# ['V', 45, 47]
    end
  end
end

describe '<Plug>(textobj-function-I)'
  before
    new
    setfiletype vim
    call PasteSampleCode('vim')
  end

  after
    close!
  end

  describe 'in a plain Vim script'
    it 'fails if the cursor is not in a function'
      Expect Select(1, 'iF') ==# ['v', 1, 1]
      Expect Select(7, 'iF') ==# ['v', 7, 7]
    end

    it 'selects the function under the cursor'
      " At the first line.
      Expect Select(2, 'iF') ==# ['V', 2, 6]

      " At a middle line.
      Expect Select(4, 'iF') ==# ['V', 2, 6]

      " At the last line.
      Expect Select(6, 'iF') ==# ['V', 2, 6]
    end

    it 'recognizes a function even if it is deeply indented'
      Expect Select(11, 'iF') ==# ['V', 9, 13]
    end

    it 'can select a function without code'
      Expect Select(15, 'iF') ==# ['V', 15, 16]
      Expect Select(16, 'iF') ==# ['V', 15, 16]
    end
  end

  describe 'in a vspec test script'
    it 'can select an outer :describe block'
      Expect Select(18, 'iF') ==# ['V', 18, 49]
      Expect Select(35, 'iF') ==# ['V', 18, 49]
      Expect Select(49, 'iF') ==# ['V', 18, 49]
    end

    it 'can select an inner :describe block'
      Expect Select(19, 'iF') ==# ['V', 19, 34]
      Expect Select(26, 'iF') ==# ['V', 19, 34]
      Expect Select(30, 'iF') ==# ['V', 19, 34]
      Expect Select(34, 'iF') ==# ['V', 19, 34]
    end

    it 'can select a :before block'
      Expect Select(20, 'iF') ==# ['V', 20, 25]
      Expect Select(21, 'iF') ==# ['V', 20, 25]
      Expect Select(25, 'iF') ==# ['V', 20, 25]
    end

    it 'can select an :after block'
      Expect Select(27, 'iF') ==# ['V', 27, 29]
      Expect Select(28, 'iF') ==# ['V', 27, 29]
      Expect Select(29, 'iF') ==# ['V', 27, 29]
    end

    it 'can select an :it block'
      Expect Select(31, 'iF') ==# ['V', 31, 33]
      Expect Select(32, 'iF') ==# ['V', 31, 33]
      Expect Select(33, 'iF') ==# ['V', 31, 33]
    end

    it 'can select a function in any block'
      Expect Select(22, 'iF') ==# ['V', 22, 24]
      Expect Select(23, 'iF') ==# ['V', 22, 24]
      Expect Select(24, 'iF') ==# ['V', 22, 24]
    end

    it 'can select an empty :describe block'
      Expect Select(37, 'iF') ==# ['V', 37, 38]
      Expect Select(38, 'iF') ==# ['V', 37, 38]
    end

    it 'can select an empty :before block'
      Expect Select(40, 'iF') ==# ['V', 40, 41]
      Expect Select(41, 'iF') ==# ['V', 40, 41]
    end

    it 'can select an empty :after block'
      Expect Select(43, 'iF') ==# ['V', 43, 44]
      Expect Select(44, 'iF') ==# ['V', 43, 44]
    end

    it 'can select an empty :it block'
      Expect Select(46, 'iF') ==# ['V', 46, 47]
      Expect Select(47, 'iF') ==# ['V', 46, 47]
    end
  end
end
