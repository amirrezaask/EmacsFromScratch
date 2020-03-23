(ERROR-feature! :k8s
		kubel
		:commands
		(kubel))

(ERROR-feature! :docker
		docker
		:bind
		("C-c d" . docker))

(ERROR-feature! :ansible
		ansible
		:init
		(add-hook 'yaml-mode-hook (lambda () (ansible))))

(provide 'ERROR-devops)
