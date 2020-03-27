(init-with-feature-package! :k8s
			     kubel
			     :commands
			     (kubel))

(init-with-feature-package! :docker
			     docker
			     :bind
			     ("C-c d" . docker))

(init-with-feature-package! :ansible
			     ansible
			     :init
			     (add-hook 'yaml-mode-hook (lambda () (ansible))))

(provide 'init-devops)
