#
# Wrap the builtin cd command to maintain directory history.
#
function cd --description "Change directory"
    set -l MAX_DIR_HIST 25

    if set -q argv[2]; and begin
            set -q argv[3]
            or not test "$argv[1]" = --
        end
        printf "%s\n" (_ "Too many args for cd command") >&2
        return 1
    end

    # Skip history in subshells.
    if status --is-command-substitution
        builtin cd $argv
        return $status
    end

    # Avoid set completions.
    set -l previous $PWD

    if test "$argv" = -
        if test "$__fish_cd_direction" = next
            nextd
        else
            prevd
        end
        return $status
    end

    builtin cd $argv
    set -l cd_status $status

    if test $cd_status -eq 0 -a "$PWD" != "$previous"
        set -q dirprev
        or set -l dirprev
        set -q dirprev[$MAX_DIR_HIST]
        and set -e dirprev[1]

        # If dirprev, dirnext, __fish_cd_direction
        # are set as universal variables, honor their scope.

        set -U -q dirprev
        and set -U -a dirprev $previous
        or set -g -a dirprev $previous

        set -U -q dirnext
        and set -U -e dirnext
        or set -e dirnext

        set -U -q __fish_cd_direction
        and set -U __fish_cd_direction prev
        or set -g __fish_cd_direction prev
    end

    # NODE.JS
    if test -e ./.nvmrc
        if not nvm use;
            nvm install
        end
    end
    if test -e ./package.json
        if not test -e ./node_modules
            npm install
            cp .env.sample .env
        end
    end

    # GIT
    if test -e ./.gitmodules
        set -q modules git submodule status | awk '{$1 = ""; $3 = ""; print substr($0, 2)}'
        if not test "$modules"
            git submodule update --init --recursive --jobs 3
        end
    end

    return $cd_status
end
