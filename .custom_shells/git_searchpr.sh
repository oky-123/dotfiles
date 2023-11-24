#!/bin/sh

# Git search PR by commit hash
function git_searchpr() {
  if [ $# != 1 ]; then
    echo "第一引数にコミットハッシュを与えてください。"
    exit 1
  fi

  gh api graphql -F owner=':owner' -F repo=':repo' -F hash=$1 -f query='
    query($repo:String!, $owner:String!, $hash:String) {
      repository(name: $repo, owner: $owner) {
        object(expression: $hash) {
          ... on Commit {
            associatedPullRequests(first: 1) {
              edges {
                node {
                  number
                }
              }
            }
          }
        }
      }
    }
  ' | jq .data.repository.object.associatedPullRequests.edges[0].node.number
}

git_searchpr $1
