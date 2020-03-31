(if-feature-use-package! :k8s
			 kubel
			 :commands
			 (kubel))

(if-feature-use-package! :docker
			 docker
			 :bind
			 ("C-c d" . docker))

(if-feature-use-package! :ansible
			 ansible
			 :init
			 (add-hook 'yaml-mode-hook (lambda () (ansible))))

(provide 'init-devops)
