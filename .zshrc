
export PATH="~/.composer/vendor/bin:$PATH"
export EDITOR='subl -w'

#COMMANDS
alias ..="cd .."
alias ...="cd ../.."
alias md='mkdir -pv'
alias h='cd ~'
alias c='clear'
alias l='ls -laF'
alias flush-cache='sudo killall -HUP mDNSResponder;say DNS cache has been flushed'

#PROMPT
export PS1="\[$(tput bold)\]\[$(tput setaf 2)\]\W \[$(tput setaf 153)\]‣ \[$(tput sgr0)\]\[$(tput sgr0)\]"

#UTILITY

alias copy-key='pbcopy < ~/.ssh/id_rsa.pub'
alias edit-commands='subl ~/.settings/.bash_aliases;'
alias reload-commands='c; source ~/.settings/.bash_aliases; echo "Done."'

#ARTISAN COMMANDS
alias art='php artisan'


alias tinker='art tinker'
alias yw='c;yarn run watch'
alias dev='c;yarn run development'
alias prod='c;yarn run production'

alias last_file='lastFileFunction(){
    
    dirname=$(ls -dt * | head -1)
    echo $dirname
    

    unset -f lastFileFunction
};lastFileFunction'


#GIT
alias gts='git status'
alias gtk='git checkout'
alias gtm='git checkout master'
alias gtc='git commit -a'
alias gtp='git push origin'
alias gta='git add .'
alias gtl='git log --pretty=format:"%h : %an : %ar : %s"'
alias gtrevert='git add -A .;git stash;git stash drop stash@{0}'


alias gtep='function __complete_episode(){ 
    
    echo processing $(($*))
    git add .
    git commit -m "completed episode $*"
    git push origin master

    c

    echo "start working on episode $(($*+1))"
    
    unset -f __complete_episode
}; __complete_episode'


#NPM
alias update-npm='c; echo "Updating NPM ..."; npm install npm@latest -g;c;echo "New NPM Version:"; npm -v'


#LARAVEL 
alias list='listFunction(){

    c
    echo "Laravel Helpers List"
    echo "--------------------"
    echo ""
    echo "ft => Feature Test"
    echo "ut => Unit Test"
    echo ""
    echo "pc => Plain Controller"
    echo "rc => Resourcefull Controller"
    echo ""
    echo "pm => Plain Model (Model with migration comming for now mn)"
    echo ""
    echo "pe => Event"
    echo "fr => Form Request"
    echo "mw => Middleware"
    echo "sp => Service Provider"
    echo "mf => Model Factory"
    echo "pr => Rule"
    echo ""
    echo "nv => New View File {path/to/name or path.name or name.blade.php}"
    echo ""
    echo "mn => New Migration, jsut the name of the table create_<posts>_table"
    echo "mp => Plain Migration, mp add_something_to_posts posts"
    echo ""

unset -f listFunction   
}; listFunction'


alias ft='{ f=$(cat -); php artisan make:test ${f}Test; pstorm tests/Feature/${f}Test.php;}<<<'
alias ut='{ f=$(cat -); php artisan make:test ${f}Test --unit; pstorm tests/Unit/${f}Test.php;}<<<'
alias pc='{ f=$(cat -); php artisan make:controller ${f}Controller; pstorm app/Http/Controllers/${f}Controller.php;}<<<'
alias rc='{ f=$(cat -); php artisan make:controller ${f}Controller -r; app/Http/Controllers/${f}Controller.php;}<<<'
alias pm='{ f=$(cat -); php artisan make:model ${f}; pstorm app/${f}.php;}<<<'
alias pe='{ f=$(cat -); php artisan make:event ${f}; pstorm app/Events/${f}.php;}<<<'
alias fr='{ f=$(cat -); php artisan make:request ${f}Request; pstorm app/Http/Requests/${f}Request.php;}<<<'
alias mw='{ f=$(cat -); php artisan make:middleware ${f}; pstorm app/Http/Middleware/${f}.php;}<<<'
alias sp='{ f=$(cat -); php artisan make:provider ${f}Provider; pstorm app/Providers/${f}Provider.php;}<<<'
alias mf='{ f=$(cat -); php artisan make:factory ${f}Factory; pstorm database/factories/${f}Factory.php;}<<<'
alias pr='{ f=$(cat -); php artisan make:rule ${f}Rule; pstorm database/factories/${f}Rule.php;}<<<'
alias nv='{ f=$(cat -); php artisan make:view ${f};}<<<'

alias mn='function __migrate-new-make(){
    tab=$(php artisan make:migration create_$*_table --create=$* --table=$*); 
    pstorm database/migrations/${tab:19}.php; 
    unset -f __migrate-new-make; 
}; __migrate-new-make'

alias mp='function __migrate-make(){
    tab=$(php artisan make:migration  --table=); 
    pstorm database/migrations/${tab:19}.php; 
    unset -f __migrate-make; 
}; __migrate-make'



alias migrate='php artisan migrate'
alias fresh='redis-cli flushall; php artisan migrate:fresh'
alias rlist='php artisan route:list'

alias cda='composer dump-autoload -o'

#TESTING PHPUNIT
alias phpspec='c;vendor/bin/phpspec'
alias phpunit='c;vendor/bin/phpunit'
alias p='c;php -n vendor/bin/phpunit'
alias pf='c;php -n vendor/bin/phpunit --filter '
alias px='phpunit'
alias pfx='phpunit --filter '



