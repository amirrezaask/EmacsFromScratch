(ERROR-feature! :k8s
	       (use-package kubel  :commands (kubel)))

(ERROR-feature! :docker
	       (use-package docker
		 :bind ("C-c d" . docker)))
(ERROR-feature! :ansible
	       (use-package ansible :defer t :init (add-hook 'yaml-mode-hook (lambda () (ansible)))))

(provide 'ERROR-devops)
