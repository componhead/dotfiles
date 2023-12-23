complete -c rakudo -n __fish_is_first_token -F -a - -d 'Read program source from STDIN or start REPL if a TTY'
complete -c rakudo -s c -d 'Check syntax only. Runs BEGIN and CHECK blocks'
complete -c rakudo -l doc -d 'Extract documentation and print it as text'
complete -c rakudo -s e -x -d 'One line of program, strict is enabled by default'
complete -c rakudo -s h -l help -x -d 'Display help text'
complete -c rakudo -s n -d 'Run program once for each line of input'
complete -c rakudo -s p -d 'Same as -n, but also print $_ at the end of lines'
complete -c rakudo -s I -r -d 'Add the path to the module search path'
complete -c rakudo -s M -r -d 'Load the module prior to running the program'
complete -c rakudo -l target -x -k -a 'start parse syntaxcheck ast optimize mast mbc moar' -d 'Specify compilation stage to emit'
complete -c rakudo -l optimize -x -d 'use the given level of optimization, pass 0..3' -a '0 1 2 3'
complete -c rakudo -s o -l output -r -d 'Specify name of output file'
complete -c rakudo -s v -x -l version -d 'Display version information'
complete -c rakudo -s V -x -d 'Print configuration summary'
complete -c rakudo -l rakudo-home -r -d 'Override the path of the Rakudo runtime files'
complete -c rakudo -l stagestats -d 'Display time spent in the compilation stages'
complete -c rakudo -l repl-mode -x -d 'Specify the REPL mode' -a 'interactive\t"Start the default interactive REPL" non-interactive\t"STDIN is read entirely and evaluated as if it were a program"'
complete -c rakudo -l profile -r -d 'Write profile information to a file. Extension controls format'
complete -c rakudo -l profile-compile -r -d 'Write compile-time profile information to a file. Extension controls format'
complete -c rakudo -l profile-kind -x -d 'Choose the type of profile to generate' -a 'instrumented\t"Performance measurements" heap\t"Record heap snapshots at every garbage collection run"'
complete -c rakudo -l profile-stage -f -d 'Write profile information for the given compilation stage to a file. Use --profile-compile to set name and format'
complete -c rakudo -l debug-port -x -d 'Listen for incoming debugger connections'
complete -c rakudo -l tracing -f -d 'Output a line to stderr on every interpreter instr, if enabled in MoarVM'
