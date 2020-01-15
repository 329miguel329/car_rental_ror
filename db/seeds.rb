# CardType
CardType.create({:code => "C.C.", :name => "Cédula de Ciudadanía"})
CardType.create({:code => "C.E.", :name => "Cédula de Extranjería"})
CardType.create({:code => "P.", :name => "Pasaporte"})

# BloodType
BloodType.create({:code => 'O+', :name => 'O Positivo'})
BloodType.create({:code => 'O-', :name => 'O Negativo'})
BloodType.create({:code => 'AB+', :name => 'AB+ Positivo'})

# USer
User.create({:email => 'admin@carrental.com', :first_name => 'Administrator', :last_name => 'Car Rental', :blood_type_id => BloodType.first.id, :card_type_id => CardType.first.id, :identfication => '123456789', :rol => 'administrator'})