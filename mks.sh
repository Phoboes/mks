if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

mks () { 
   echo "-------------------------------------"
   if [[ -d "$1" ]];
    then
    echo "Duplicate filename found. Aborting."
    echo "-------------------------------------"
    return
  fi
  if [[ $1 ]];
    then
    mkdir $1
    cd $1
    echo $1  "folder has been created."
  fi
  mkdir js 
  touch js/main.js 
  mkdir css 
  touch css/style.css
  printf "<!DOCTYPE html>
  <html lang=\"en\">
  <head>
    <meta charset=\"UTF-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
    <title>Document</title>" >> index.html
     
  for var in ${@:2}
  do
  shopt -s nocasematch
      case "$var" in
        ("jq" | "jQuery") echo "Jquery v3.1.1 added."; 
        curl https://code.jquery.com/jquery-3.1.1.slim.min.js > js/jQuery.js;
        printf "\n\t\t\t<script src=\"js/jQuery.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("bb" | "backbone") echo "Backbone v1.3.3 added."; 
         curl https://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.3.3/backbone-min.js > js/backbone.js;  
         printf "\n\t\t\t<script src=\"js/backbone.js\"></script>" >> index.html;
         echo "-------------------------------------";;

        ("us" | "underscore") echo "Underscore v 1.8.3 added."; 
        curl https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js > js/underscore.js 
        printf "\n\t\t\t<script src=\"js/underscore.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("d3") echo "D3 v4 added."; 
        curl https://d3js.org/d3.v4.min.js > js/d3.js;
        printf "\n\t\t\t<script src=\"js/d3.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("3JS" | "3" | "three") echo "3JS added."; 
        curl https://threejs.org/build/three.min.js > js/THREE.js;
        printf "\n\t\t\t<script src=\"js/THREE.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("react") echo "React v1.5 added. But why?"; 
        curl https://unpkg.com/react@15/dist/react.js > js/react.js;
        printf "\n\t\t\t<script src=\"js/react.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("reactdom" | "rctdm" | "dom" | "rdom") echo "ReactDOM v1.5 added.";
       curl https://unpkg.com/react-dom@15/dist/react-dom.js > js/React.js;
        printf "\n\t\t\t<script src=\"js/React.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("redux") echo "Redux v3.6 added."; 
        curl https://cdnjs.cloudflare.com/ajax/libs/redux/3.6.0/redux.min.js > js/redux.js;
         printf "\n\t\t\t<script src=\"js/redux.js\"></script>" >> index.html;
         echo "-------------------------------------";;

        ("ember" | "embr") echo "Ember v 2.11 added."; 
        curl https://cdnjs.cloudflare.com/ajax/libs/ember.js/2.11.2/ember.min.js > js/ember.js;
         printf "\n\t\t\t<script src=\"js/ember.js\"></script>" >> index.html;
         echo "-------------------------------------";;

        ("vue") echo "Vue v 2.11 added."; 
        curl https://cdnjs.cloudflare.com/ajax/libs/vue/2.2.1/vue.min.js > js/vue.js
         printf "\n\t\t\t<script src=\"js/vue.js\"></script>" >> index.html;;
        (*) echo "Unknown library.";
        echo "-------------------------------------";;
      esac
    done


     printf "\n\t\t\t<script src=\"js/main.js\"></script>
    <link rel=\"stylesheet\" href=\"css/style.css\">
    </head>
  <body>

  </body>
  </html>" >> index.html

   open -a "Sublime Text 2" . index.html

  echo "File generation complete."
  echo "-------------------------------------"
}
