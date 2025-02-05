(setq doom-theme 'doom-palenight)
  (setq display-line-numbers-type t)
  (setq org-directory "~/org/")
  (setq
   left-fringe-width 0
   right-fringe-width 0)

  (delete-selection-mode t)


  (setq doom-font (font-spec :family "JetBrainsMonoNL NF " :size 15)
         doom-big-font (font-spec :family "JetBrainsMonoNL NF " :size 20)
         doom-variable-pitch-font (font-spec :family "Overpass" :size 24)
         doom-variable-pitch-font (font-spec :family "IBM Plex Mono" :weight 'light))

(global-subword-mode 1)                           ; Iterate through CamelCase words

(setq evil-vsplit-window-right t
      evil-split-window-below t)

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))

(solaire-global-mode +1)
(golden-ratio-mode +1)
(setq golden-ratio-auto-scale t)

(use-package! info-colors
  :commands (info-colors-fontify-node))

(add-hook 'Info-selection-hook 'info-colors-fontify-node)

(use-package! gptel)
        ;; OpenRouter offers an OpenAI compatible API
        (gptel-make-openai "OpenRouter"               ;Any name you want
          :host "openrouter.ai"
          :endpoint "/api/v1/chat/completions"
          :stream t
          :key "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"                   ;can be a function that returns the key
          :models '(meta-llama/llama-3.1-70b-instruct:free
                    nousresearch/hermes-3-llama-3.1-405b:free
                    liquid/lfm-40b:free
                   meta-llama/llama-3.2-90b-vision-instruct:free
                   mistralai/mistral-7b-instruct:free
                    google/gemma-2-9b-it:free
                    google/gemini-flash-1.5-exp
                    google/gemini-pro-1.5-exp))

      (gptel-make-openai "Perplexity"         ;Any name you want
        :host "api.perplexity.ai"
        :key "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"                   ;can be a function that returns the key
        :endpoint "/chat/completions"
        :stream t
        :models '(;; has many more, check perplexity.ai
                  llama-3.1-sonar-small-128k-online
                  llama-3.1-sonar-large-128k-online
                  llama-3.1-sonar-huge-128k-online))

(setq gptel-org-branching-context t)

(defun nathan-date (arg)
  (interactive "P")
  (insert (if arg
              (format-time-string "%d.%m.%Y")
            (format-time-string "%Y-%m-%d"))))

(map! :leader :n "y k" 'consult-yank-from-kill-ring)

(map! :map  java-mode-map
    :n "e l" 'consult-lsp-diagnostics
    :n "e n" 'next-error); q in normal+visual states)

(map! :leader
   (:prefix ("o" . "gptel")
     :desc "Open GPTEL" "g p" #'gptel))

(map! :leader
      (:prefix ("o" . "gptel")
      :desc "gptel menu" "g m" #'gptel-menu))

(display-time-mode +1)
(setq display-time-format "%a %d/%m %H:%M")
(setq mode-line-percent-position nil)
(setq mode-line-percent-position '(-3 ""))
(setq mode-line-position-column-line-format '("%l"))

(setq lsp-java-maven-download-sources t)
(setq lsp-java-import-gradle-enabled t)
(setq lsp-modeline-code-action-fallback-icon "" )

(require 'lsp-java-boot)

;;   ;; to enable the lenses
(add-hook 'lsp-mode-hook #'lsp-lens-mode)
(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'rainbow-identifiers-mode)
(setq lsp-log-io t)

(set-docsets! 'java-mode "Java")

(setq projectile-sort-order 'recently-active)

;; Alternative 1: Enable Jinx globally
(add-hook 'emacs-startup-hook #'global-jinx-mode)
