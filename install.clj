(require '[clojure.java.io :as io])

(def zsh-osx-plugins [:osx :terminalapp :sublime])
(def zsh-ubuntu-plugins [:command-not-found])
(def zsh-freebsd-plugins [])
(def zsh-common-plugins [:gitfast :last-working-dir :per-directory-history :cp])
(def zsh-platform-plugins {:osx zsh-osx-plugins, :ubuntu zsh-ubuntu-plugins, :freebsd zsh-freebsd-plugins})

(defn platform?
  "get OS name, can be :osx, :ubuntu, :freebsd, or :unknown"
  []
  (let [file-exists? #(.exists (io/as-file %1))] 
    (cond
      (file-exists? "/System/Library/LaunchDaemons") :osx
      (file-exists? "/etc/rc.conf") :freebsd
      (file-exists? "/etc/lsb-release") :ubuntu
    :else :unknown)))
  
;(defn get-zsh-plugins-by-platform
;  []
;  )
;

;(oh-my-zshrc
;  {:theme theme
;   :plugins plugin
;  }
;)
