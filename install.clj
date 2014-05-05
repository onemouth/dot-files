(require '[clojure.java.io :as io]
         '[clojure.string :as string])

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
  (string/join ["ZSH_THEME=\"" (name theme) "\""]))

(defn to-zsh-plugins-worker
  "to zshrc plugins command"
  [plugins]
  (let [add-space #(str %1 " ")
        str-plugins (apply str (map (comp add-space name) (seq plugins)))]
    #_(print str-plugins)
    (str "plugins=(" (string/trim str-plugins) ")")))

(defn to-zsh-plugins
  [plugins]
  (if (= plugins :by-platform)
    (to-zsh-plugins-worker (get-zsh-plugins-by-platform (platform?)))
    (to-zsh-plugins-worker plugins)))

(defn oh-my-zshrc
  [configs]
  (let [{:keys [theme config plugins]} configs
        str-config [(to-zsh-config config)
                    (to-zsh-theme theme)
                    (to-zsh-plugins plugins)]
        ]
    (string/join "\n\n" str-config)))

(println
(oh-my-zshrc
  {:config "$HOME/.oh-my-zsh"                    ;Path to your oh-my-zsh configuration.
   :theme  :ys                                   ;
   :case-sensitive true
   :disable-auto-update false
   :update-zsh-days 13
   :disable-auto-title false
   :disable-correction false
   :completion-waiting-dots false
   :disable-untracked-files-dirty false
   :alias-command {}
   :export-variable {}
   :other-commands []
   :plugins :by-platform})
)




