remotes = `git branch -r`.split.map {|x| x.sub('origin/', '') }
locals = `git branch`.split.select {|x| x != '*' }
complement = locals.select {|x| not (remotes.include? x) }

# Ask if local branches should be deleted
for branch in complement do
  puts "'#{branch}' not in remotes, delete?"
  if gets.chomp == "y"
    `git branch -D #{branch}` and puts "Deleted #{branch}"
  end
end
