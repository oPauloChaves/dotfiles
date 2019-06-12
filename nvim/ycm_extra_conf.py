def Settings( **kwargs ):
  return {
    'flags': [
      '-x',
      'c++',
      '-Wall',
      '-Wextra',
      '-Werror',
      '-std=c++14',
      '-isystem', '/usr/include/c++/7',
      '-isystem', '/usr/include/x86_64-linux-gnu/c++/7',
      '-isystem', '/usr/include/c++/7/backward',
      '-isystem', '/usr/lib/gcc/x86_64-linux-gnu/7/include',
      '-isystem', '/usr/local/include',
      '-isystem', '/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed',
      '-isystem', '/usr/include/x86_64-linux-gnu',
      '-isystem', '/usr/include',
    ],
  }
