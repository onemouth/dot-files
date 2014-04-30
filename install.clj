(require '[clojure.java.io :as io]
         '[clojure.string :as string])

(def theme :ys)

(def zsh-osx-plugins #{:osx :terminalapp :sublime})
(def zsh-ubuntu-plugins #{:command-not-found})
(def zsh-freebsd-plugins #{})
(def zsh-common-plugins #{:gitfast :last-working-dir :per-directory-history :cp})
(def zsh-platform-plugins {:osx zsh-osx-plugins
                           :ubuntu zsh-ubuntu-plugins
                           :freebsd zsh-freebsd-plugins
                           :unknown #{}})

(defn platform?
  "get OS name, can be :osx, :ubuntu, :freebsd, or :unknown"
  []
  (let [file-exists? #(.exists (io/as-file %1))] 
    (cond
      (file-exists? "/System/Library/LaunchDaemons") :osx
      (file-exists? "/etc/rc.conf") :freebsd
      (file-exists? "/etc/lsb-release") :ubuntu
    :else :unknown)))

(defn get-zsh-plugins-by-platform
 [platform] 
 (let [platform-plugins (or (platform zsh-platform-plugins) #{})]
   (into zsh-common-plugins platform-plugins)))
   
(defn to-zsh-theme
  "to zshrc theme command"
  [theme]
  (str "ZSH_THEME=" (name theme)))

(defn to-zsh-plugins
  "to zshrc plugins command"
  [plugins]
  (let [add-space #(str %1 " ")
        str-plugins (apply str (map (comp add-space name) (seq plugins)))]
    #_(print str-plugins)
    (str "plugins=(" (string/trim str-plugins) ")")))

;(oh-my-zshrc
;  {:theme theme
;   :plugins plugin
;  }
;)
