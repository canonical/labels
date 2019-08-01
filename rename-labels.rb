require 'octokit'
require 'json'

Octokit.auto_paginate = true


client = Octokit::Client.new \
  :access_token     => "<PERSONAL GITHUB TOKEN>"


user = client.user '<GITHUB USERNAME>'

done = [
  'canonical-web-and-design/jaas.ai',
  'canonical-web-and-design/vanillaframework.io',
  'canonical-web-and-design/maas.io',
  'canonical-web-and-design/vanilla-framework',
]

repos = [
    'canonical-web-and-design/discoursifier',
    'canonical-web-and-design/canonical.com',
    'canonical-web-and-design/microk8s.io',
    'canonical-web-and-design/ubuntu.com',
    'canonical-web-and-design/canonicalwebteam.blog',
    'canonical-web-and-design/releases.demo.haus',
    'canonical-web-and-design/labels',
    'canonical-web-and-design/unified-email-template',
    'canonical-web-and-design/global-nav',
    'canonical-web-and-design/cookie-policy',
    'canonical-web-and-design/maas-ui',
    'canonical-web-and-design/tutorials.ubuntu.com',
    'canonical-web-and-design/landscape-brochure.internal',
    'canonical-web-and-design/docs.jujucharms.com',
    'canonical-web-and-design/docs.snapcraft.io',
    'canonical-web-and-design/design.ubuntu.com',
    'canonical-web-and-design/docs.ubuntu.com',
    'canonical-web-and-design/generator-canonical-webteam',
    'canonical-web-and-design/cloud-init.io',
    'canonical-web-and-design/partners.ubuntu.com',
    'canonical-web-and-design/www.canonical.com',
    'canonical-web-and-design/buy.ubuntu.com',
    'canonical-web-and-design/manager.assets.ubuntu.com',
    'canonical-web-and-design/mir-server.io',
    'canonical-web-and-design/multipass.run',
    'canonical-web-and-design/assets.ubuntu.com',
    'canonical-web-and-design/docs.conjure-up.io',
    'canonical-web-and-design/conjure-up.io',
    'canonical-web-and-design/netplan.io',
    'canonical-web-and-design/practices',
    'canonical-web-and-design/cn.ubuntu.com',
    'canonical-web-and-design/juju-cards',
    'canonical-web-and-design/jp.ubuntu.com',
    'canonical-web-and-design/canonicalwebteam.discourse-docs',
    'canonical-web-and-design/test-and-learn',
    'canonical-web-and-design/demoservice',
    'canonical-web-and-design/greenhouse.io',
    'canonical-web-and-design/example-js',
    'canonical-web-and-design/discourse-markdown-note',
    'canonical-web-and-design/canonicalwebteam.templatefinder',
    'canonical-web-and-design/deployment-configs',
    'canonical-web-and-design/canonicalwebteam.flask-base',
    'canonical-web-and-design/ubuntu-core-docs',
    'canonical-web-and-design/design-vanilla-framework',
    'canonical-web-and-design/upload-assets',
    'canonical-web-and-design/task-creator',
    'canonical-web-and-design/landscape-docs',
    'canonical-web-and-design/canonical-wp-rest-cache',
    'canonical-web-and-design/praecepta',
    'canonical-web-and-design/canonicalwebteam.yaml-responses',
    'canonical-web-and-design/canonicalwebteam.django-views',
    'canonical-web-and-design/dockerfiles',
    'canonical-web-and-design/asset-mapper',
    'canonical-web-and-design/custom-response-headers',
    'canonical-web-and-design/get-feeds',
    'canonical-web-and-design/versioned-static',
    'canonical-web-and-design/canonicalwebteam.http',
    'canonical-web-and-design/docker-dev',
    'canonical-web-and-design/image-template',
    'canonical-web-and-design/snapcraft-email-comms',
    'canonical-web-and-design/design-vanillaframework.io',
    'canonical-web-and-design/canonical-doc-utils',
    'canonical-web-and-design/github-to-influx',
    'canonical-web-and-design/ua-token',
    'canonical-web-and-design/ubuntu-copy-docs',
    'canonical-web-and-design/zenhub-backlog-updater',
    'canonical-web-and-design/usn.ubuntu.com',
    'canonical-web-and-design/flask-openid',
    'canonical-web-and-design/older-apis',
    'canonical-web-and-design/doctest',
    'canonical-web-and-design/www.ubuntu.com-design',
    'canonical-web-and-design/docs-tutorials',
    'canonical-web-and-design/design.ubuntu.com-design',
    'canonical-web-and-design/conjure-up.io-design',
    'canonical-web-and-design/ubuntu.com-takeover-archive',
    'canonical-web-and-design/ubuntu-horizon-theme',
    'canonical-web-and-design/style-guides',
    'canonical-web-and-design/docs-demo',
    'canonical-web-and-design/ubuntu-china-wordpress-theme',
    'canonical-web-and-design/django-feed-tag',
    'canonical-web-and-design/webteam-project-builder',
    'canonical-web-and-design/scopes-roulette',
    'canonical-web-and-design/git-mirror-service',
    'canonical-web-and-design/dokku-deploy-image-plugin',
    'canonical-web-and-design/buildstep',
    'canonical-web-and-design/heroku-buildpack-python-with-bzr',
]

default_labels = {
    "Priority: Low" => "ffffff",
    "Priority: Medium" => "f7dc6f",
    "Priority: High" => "f5b041",
    "Priority: Critical" => "c7162b",
    "Review: Design needed" => "cdcdcd",
    "Review: Code needed" => "cdcdcd",
    "Review: QA needed" => "cdcdcd",
    "Review: UX needed" => "cdcdcd",
    "Review: Design +1" => "0e8420",
    "Review: Code +1" => "0e8420",
    "Review: QA +1" => "0e8420",
    "Review: UX +1" => "0e8420",
    "Review: Design -1" => "c7162b",
    "Review: Code -1" => "c7162b",
    "Review: QA -1" => "c7162b",
    "Review: UX -1" => "c7162b",
    "Question" => "333333",
    "Good first issue" => "8169ce",
    "Help wanted" => "bec2F7",
    "Don't merge" => "c7162b",
    "Blocked" => "c7162b",
    "Duplicate" => "c5def5",
    "Invalid" => "c5def5",
    "Won't fix" => "c5def5",
    "Master Epic" => "f9e636",
    "Project Fuse ⚡️" => "d96ae8",
    "Released ✈️" => "7f33b2",
    "Copy update" => "a9f9f1",
    "Epic" => "3e4b9e",
}

rename_labels = {
  "✈️ Released" => "Released ✈️",
  "⚡️ Project Fuse" => "Project Fuse ⚡️",
  "question" => "Question",
  "good first issue" => "Good first issue",
  "help wanted" => "Help wanted",
  "duplicate" => "Duplicate",
  "invalid" => "Invalid",
  "Dont merge" => "Don't merge",
}

remove_labels = [
    'wontfix',
    'invalid',
    'help wanted',
    'enhancement',
    'bug',
    'Wont fix',
    'Status: Blocked',
    'Status: Duplicate',
    'Status: In progress',
    'Status: Invalid',
    'Status: More info needed',
    'Status: Review',
    'Status: Triaged',
    'Status: Won%27t fix',
]

repos.each do | repo |
	puts '# Repo %s' % repo

	repo_labels = client.labels(repo)
	rename_labels.each do |from_name, to_name|
		existing_label = repo_labels.select{|k,v| k.name == from_name}.first
		if existing_label
			puts 'Renaming label from %s to %s' % [from_name, to_name]
			client.update_label(repo, from_name, {:name => to_name})
		end
	end

	# Fetch labels again because they might've been renamed
	repo_labels = client.labels(repo)
	default_labels.each do |name, color|
		existing_label = repo_labels.select{|k,v| k.name == name}.first
		if existing_label
			puts 'Updating label %s' % (name)
			client.update_label(repo, name, {:color => color})
		else
			puts 'Adding label %s' % (name)
			client.add_label(repo, name, color)
		end
	end

	remove_labels.each do |name|
		puts 'Removing label %s' % (name)
		client.delete_label!(repo, name)
	end

end
