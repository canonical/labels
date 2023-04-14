require 'octokit'
require 'json'

Octokit.auto_paginate = true


client = Octokit::Client.new \
  :access_token     => "<PERSONAL GITHUB TOKEN>"


user = client.user '<GITHUB USERNAME>'

done = [
  'canonical/jaas.ai',
  'canonical/vanillaframework.io',
  'canonical/maas.io',
  'canonical/vanilla-framework',
]

repos = [
    'canonical/discoursifier',
    'canonical/canonical.com',
    'canonical/microk8s.io',
    'canonical/ubuntu.com',
    'canonical/canonicalwebteam.blog',
    'canonical/labels',
    'canonical/unified-email-template',
    'canonical/global-nav',
    'canonical/cookie-policy',
    'canonical/maas-ui',
    'canonical/design.ubuntu.com',
    'canonical/docs.ubuntu.com',
    'canonical/cloud-init.io',
    'canonical/partners.ubuntu.com',
    'canonical/www.canonical.com',
    'canonical/manager.assets.ubuntu.com',
    'canonical/mir-server.io',
    'canonical/multipass.run',
    'canonical/assets.ubuntu.com',
    'canonical/docs.conjure-up.io',
    'canonical/netplan.io',
    'canonical/cn.ubuntu.com',
    'canonical/jp.ubuntu.com',
    'canonical/canonicalwebteam.discourse-docs',
    'canonical/greenhouse.io',
    'canonical/example-js',
    'canonical/discourse-markdown-note',
    'canonical/canonicalwebteam.templatefinder',
    'canonical/deployment-configs',
    'canonical/canonicalwebteam.flask-base',
    'canonical/ubuntu-core-docs',
    'canonical/design-vanilla-framework',
    'canonical/canonicalwebteam.upload-assets',
    'canonical/task-creator',
    'canonical/landscape-docs',
    'canonical/praecepta',
    'canonical/canonicalwebteam.yaml-responses',
    'canonical/canonicalwebteam.django-views',
    'canonical/dockerfiles',
    'canonical/asset-mapper',
    'canonical/canonicalwebteam.get-feeds',
    'canonical/canonicalwebteam.versioned-static',
    'canonical/canonicalwebteam.http',
    'canonical/canonicalwebteam.image-template',
    'canonical/snapcraft-email-comms',
    'canonical/ubuntu-copy-docs',
    'canonical/zenhub-backlog-updater',
    'canonical/usn.ubuntu.com',
    'canonical/flask-openid',
    'canonical/canonical-reference-library',
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
