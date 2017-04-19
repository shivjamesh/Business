delete_branches = [
    'branch_a',
    'branch_b',
    'branch_c',
]

delete_branches.each do |branch|
  system "git branch -D #{branch}"
  system "git push origin --delete #{branch}"
end
