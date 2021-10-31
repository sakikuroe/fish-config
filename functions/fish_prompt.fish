function fish_prompt --description 'Informative prompt'
    #Save the return status of the previous command
    set -l last_pipestatus $pipestatus
    echo
    switch "$USER"
        case root toor
            printf '%s@%s %s%s%s# ' $USER (prompt_hostname) (set -q fish_color_cwd_root
                                                             and set_color $fish_color_cwd_root
                                                             or set_color $fish_color_cwd) \
                (prompt_pwd) (set_color normal)
        case '*'
            set_color c0c0c0
            printf '[%s] %s %s%s %s%s%s \f\r ' (date "+%H:%M:%S") (set_color brblue) (set_color 66ffff) (prompt_pwd) $pipestatus_string
            set_color ffd700    
            printf '>>> '       
    end
end
