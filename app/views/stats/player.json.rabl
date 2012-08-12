collection @stats
attributes :id, :wins, :losses, :played, :excluded
child :game do
  attributes :id, :name
end
