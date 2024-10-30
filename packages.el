;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;; (package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;; (package! another-package
;;   :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;; (package! this-package
;;   :recipe (:host github :repo "username/repo"
;;            :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;; (package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;; (package! builtin-package :recipe (:nonrecursive t))
;; (package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;; (package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;; (package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;; (unpin! pinned-package)
;; ...or multiple packages
;; (unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;; (unpin! t)
;; (package! zoom)

(package! golden-ratio)
(package! solaire-mode)
(package! keyfreq
  :recipe (:host github :repo "KirmTwinty/keyfreq")
  )


(package! minions)
(package! mood-line)

(package! colorful-mode)
(package! rainbow-identifiers)
;; (unpin! projectile)

(package! pkg-info)
(unpin! lsp-java)
(package! lsp-java
  :recipe (:host github :repo "emacs-lsp/lsp-java")
  )

(unpin! lsp-mode)
(package! lsp-mode)
(package! jinx)
(package! aas :recipe (:host github :repo "ymarco/auto-activating-snippets")
  :pin "ddc2b7a58a2234477006af348b30e970f73bc2c1")
(package! etrace :recipe (:host github :repo "aspiers/etrace")
  :pin "2291ccf2f2ccc80a6aac4664e8ede736ceb672b7")

(package! info-colors :pin "2e237c301ba62f0e0286a27c1abe48c4c8441143")

(package! keycast :pin "53514c3dc3dfb7d4c3a65898b0b3edb69b6536c2")
(package! gptel)

(package! everforest
  :recipe (:host github :repo "Theory-of-Everything/everforest-emacs"))
