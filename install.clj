(require '[clojure.java.io :as io]
         '[clojure.string :as string])

(def config "$HOME/.oh-my-zsh")
(def theme :ys)
(def case-sensitive true)
(def disable-auto-update false)
(def update-zsh-days 13)
(def disable-ls-colors false)
(def disable-auto-title false)
(def disable-correction false)
(def completion-waiting-dots false)
(def disable-untracked-files-dirty false)
(def alias-command {})
(def export-variable {})

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

(defn to-zsh-config
  [config]
  (str "ZSH=" config))

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

(defn oh-my-zshrc
  [configs]
  (let [{:keys [theme config plugins]} configs
        str-config [(to-zsh-config config)
                    (to-zsh-theme theme)
                    (to-zsh-plugins plugins)]
        ]
    (string/join "\n\n" str-config)))

(oh-my-zshrc
  {
   :config config 
   :theme theme
   :plugins (get-zsh-plugins-by-platform (platform?))
  }
)


