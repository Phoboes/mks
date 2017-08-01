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
        ("jq" | "jQuery") echo "jQuery added. - https://unpkg.com/jQuery"; 
        url="$(curl -Ls -o /dev/null -w %{url_effective} https://unpkg.com/jQuery)";
        curl "${url}" > jQuery.js;
        printf "\n\t\t<script src=\"js/jQuery.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("bb" | "backbone") echo "Backbone added. - https://unpkg.com/backbone"; 
        url="$(curl -Ls -o /dev/null -w %{url_effective} https://unpkg.com/backbone)";
        curl "${url}" > backbone.js;
         printf "\n\t\t<script src=\"js/backbone.js\"></script>" >> index.html;
         echo "-------------------------------------";;

        ("us" | "underscore") echo "Underscore added. - https://unpkg.com/underscore"; 
        url="$(curl -Ls -o /dev/null -w %{url_effective} https://unpkg.com/underscore)";
        curl "${url}" > underscore.js;
 
        printf "\n\t\t<script src=\"js/underscore.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("d3") echo "D3 added. - https://unpkg.com/d3."; 
        url="$(curl -Ls -o /dev/null -w %{url_effective} https://unpkg.com/d3)";
        curl "${url}" > d3.js;
        printf "\n\t\t<script src=\"js/d3.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("3JS" | "3" | "three") echo "3JS added. - https://unpkg.com/three"; 
        url="$(curl -Ls -o /dev/null -w %{url_effective} https://unpkg.com/three)";
        curl "${url}" > THREE.js;
        printf "\n\t\t<script src=\"js/THREE.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("react") echo "React added. But why? - https://unpkg.com/react/dist/react.js"; 
        url="$(curl -Ls -o /dev/null -w %{url_effective} https://unpkg.com/react/dist/react.js)";
        curl "${url}" > react.js;
        printf "\n\t\t<script src=\"js/react.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("reactdom" | "rctdm" | "dom" | "rdom") echo "ReactDOM added. - https://unpkg.com/react-dom/dist/react-dom.js";
        url="$(curl -Ls -o /dev/null -w %{url_effective} https://unpkg.com/react-dom/dist/react-dom.js)";
        curl "${url}" > react-dom.js;
        printf "\n\t\t<script src=\"js/react-dom.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("redux") echo "Redux added. - https://unpkg.com/redux/dist/redux"; 
        url="$(curl -Ls -o /dev/null -w %{url_effective} https://unpkg.com/redux/dist/redux)";
        curl "${url}" > redux.js;
        printf "\n\t\t<script src=\"js/redux.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("gsap" | "greensocks" | "greensock" | "green" | "gs" | "green_socks" | "green_sock") echo "GreenSock added. - https://unpkg.com/gsap"; 
        url="$(curl -Ls -o /dev/null -w %{url_effective} https://unpkg.com/gsap)";
        curl "${url}" > greensock.js;
        printf "\n\t\t<script src=\"js/greensock.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("ember" | "mbr") echo "Ember added. - https://unpkg.com/ember-source/dist/ember.min.js"; 
        url="$(curl -Ls -o /dev/null -w %{url_effective} https://unpkg.com/ember-source/dist/ember.min.js)";
        curl "${url}" > ember.js;
        printf "\n\t\t<script src=\"js/ember.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("paper" | "pjs" | "paperjs") echo "PaperJS added. - https://unpkg.com/paper/dist/paper-full.js"; 
        url="$(curl -Ls -o /dev/null -w %{url_effective} https://unpkg.com/paper/dist/paper-full.js)";
        curl "${url}" > paper.js;
        printf "\n\t\t<script src=\"js/paper.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("phaser" | "phsr" ) echo "Phaser 2 added. - https://unpkg.com/phaser/dist/p2.js"; 
        url="$(curl -Ls -o /dev/null -w %{url_effective} https://unpkg.com/phaser/dist/p2.js)";
        curl "${url}" > phaser2.js;
        printf "\n\t\t<script src=\"js/phaser2.js\"></script>" >> index.html;
        echo "-------------------------------------";;

        ("vue") echo "Vue added. - https://unpkg.com/vue/dist/vue.js"; 
        url="$(curl -Ls -o /dev/null -w %{url_effective} https://unpkg.com/vue/dist/vue.js)";
        curl "${url}" > vue.js;
        printf "\n\t\t<script src=\"js/vue.js\"></script>" >> index.html;;
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
