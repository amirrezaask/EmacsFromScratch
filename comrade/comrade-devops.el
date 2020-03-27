(comrade-with-feature-package! :k8s
			     kubel
			     :commands
			     (kubel))

(comrade-with-feature-package! :docker
			     docker
			     :bind
			     ("C-c d" . docker))

(comrade-with-feature-package! :ansible
			     ansible
			     :init
			     (add-hook 'yaml-mode-hook (lambda () (ansible))))

(provide 'comrade-devops)
