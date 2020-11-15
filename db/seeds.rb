mean_girls = %w(Cady Gretchen Regina Janice Karen)
mean_girls.each do |girl|
  User.create!(name: girl)
end

cady = User.find_by_name('Cady')
janice = User.find_by_name('Janice')
Message.create!(sender_id: cady.id, recipient_id: janice.id, body: 'Are you coming to my art show?')
Message.create!(sender_id: cady.id, recipient_id: janice.id, body: 'Hello?')

regina = User.find_by_name('Regina')
Message.create!(sender_id: regina.id, recipient_id: janice.id, body: 'Ew, gross.')
