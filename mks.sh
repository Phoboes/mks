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
  
  mkdir js css
  touch css/style.css js/main.js
  printf "<!DOCTYPE html>
<html lang=\"en\">
  <head>
    <meta charset=\"UTF-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">" >> index.html
     
    printf "
    <title>$1</title>" >> index.html

  for ((i=2;i<=$#;i++))
  do
  shopt -s nocasematch
      case ${!i} in
        ("jq" | "jQuery") echo "Jquery v3.2.1 added. - https://code.jquery.com/jquery-3.2.1.js"; 
        curl https://code.jquery.com/jquery-3.2.1.js > js/jQuery.js;
        printf "\n\t\t\t<script src=\"js/jQuery.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("bb" | "backbone") echo "Backbone v1.3.3 added. - https://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.3.3/backbone-min.js"; 
         curl https://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.3.3/backbone-min.js > js/backbone.js;  
         printf "\n\t\t\t<script src=\"js/backbone.js\"></script>" >> index.html;
         echo "-------------------------------------";;

        ("us" | "underscore") echo "Underscore v 1.8.3 added. - https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"; 
        curl https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js > js/underscore.js 
        printf "\n\t\t\t<script src=\"js/underscore.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("d3") echo "D3 v4 added. - https://d3js.org/d3.v4.min.js"; 
        curl https://d3js.org/d3.v4.min.js > js/d3.js;
        printf "\n\t\t\t<script src=\"js/d3.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("3JS" | "3" | "three") echo "3JS added. - https://threejs.org/build/three.min.js"; 
        curl https://threejs.org/build/three.min.js > js/THREE.js;
        printf "\n\t\t\t<script src=\"js/THREE.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("react") echo "React v1.5 added. But why? - https://unpkg.com/react@15/dist/react.js"; 
        curl https://unpkg.com/react@15/dist/react.js > js/react.js;
        printf "\n\t\t\t<script src=\"js/react.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("reactdom" | "rctdm" | "dom" | "rdom") echo "ReactDOM v1.5 added. - https://unpkg.com/react-dom@15/dist/react-dom.js";
        curl https://unpkg.com/react-dom@15/dist/react-dom.js > js/React.js;
        printf "\n\t\t\t<script src=\"js/React.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("redux") echo "Redux v3.6 added. - https://cdnjs.cloudflare.com/ajax/libs/redux/3.6.0/redux.min.js"; 
        curl https://cdnjs.cloudflare.com/ajax/libs/redux/3.6.0/redux.min.js > js/redux.js;
        printf "\n\t\t\t<script src=\"js/redux.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("tm" | "tweenmax" | "tmax") echo "Redux v3.6 added. - http://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js"; 
        curl http://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js > js/tweenmax.js;
        printf "\n\t\t\t<script src=\"js/tweenmax.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("ember" | "mbr") echo "Ember v 2.11 added. - https://cdnjs.cloudflare.com/ajax/libs/ember.js/2.11.2/ember.min.js"; 
        curl https://cdnjs.cloudflare.com/ajax/libs/ember.js/2.11.2/ember.min.js > js/ember.js;
        printf "\n\t\t\t<script src=\"js/ember.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("paper" | "pjs" | "paperjs") echo "PaperJS v 0.10.3 added. - https://cdnjs.cloudflare.com/ajax/libs/paper.js/0.10.3/paper-full.min.js"; 
        curl https://cdnjs.cloudflare.com/ajax/libs/paper.js/0.10.3/paper-full.min.js >> js/paper.js
        printf "\n\t\t\t<script src=\"js/paper.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("vue") echo "Vue v 2.11 added. - https://cdnjs.cloudflare.com/ajax/libs/vue/2.2.1/vue.min.js"; 
        curl https://cdnjs.cloudflare.com/ajax/libs/vue/2.2.1/vue.min.js > js/vue.js
        printf "\n\t\t\t<script src=\"js/vue.js\"></script>" >> index.html;;
        (*) echo "Unknown library.";
        echo "-------------------------------------";;
      esac
    done


     printf "\n\t\t<script src=\"js/main.js\"></script>
    <link rel=\"stylesheet\" href=\"css/style.css\">
  </head>
  <body>

  </body>
</html>" >> index.html

   open -a "atom" . index.html

  echo "File generation complete."
  echo "-------------------------------------"
}
