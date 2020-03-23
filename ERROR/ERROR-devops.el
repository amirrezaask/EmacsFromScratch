(ERROR-with-feature-package! :k8s
		kubel
		:commands
		(kubel))

(ERROR-with-feature-package! :docker
		docker
		:bind
		("C-c d" . docker))

(ERROR-with-feature-package! :ansible
		ansible
		:init
		(add-hook 'yaml-mode-hook (lambda () (ansible))))

(provide 'ERROR-devops)
