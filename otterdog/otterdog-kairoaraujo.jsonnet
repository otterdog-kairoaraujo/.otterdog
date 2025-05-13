local orgs = import 'vendor/otterdog/examples/template/otterdog-defaults.libsonnet';

orgs.newOrg('otterdog-kairoaraujo', 'otterdog-kairoaraujo') {
  settings+: {
    billing_email: "kairo@dearaujo.nl",
    members_can_create_private_repositories: true,
    members_can_create_public_repositories: true,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('.otterdog') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('testrepo') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      gh_pages_build_type: 'legacy',
      gh_pages_source_branch: 'gh-pages',
      gh_pages_source_path: '/',
      workflows+: {
        default_workflow_permissions: 'write',
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            'gh-pages',
          ],
          deployment_branch_policy: 'selected',
        },
      ],
    },
  ],
}
