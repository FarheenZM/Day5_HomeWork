def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
  pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, num)
    pet_shop[:admin][:pets_sold] += num
end

def stock_count(pet_shop)
  return pet_shop[:pets].count
end

def pets_by_breed(pet_shop, breed)
  pets_of_same_breed = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      pets_of_same_breed.push(pet)
    end
  end
  return pets_of_same_breed
end

def find_pet_by_name(pet_shop, name)
  pet_found = nil
  for pet in pet_shop[:pets]
    if pet[:name] == name
      pet_found = pet
      break
    end
  end
  return pet_found
end

def remove_pet_by_name(pet_shop, name)
  pet = find_pet_by_name(pet_shop, name)
  if pet != nil
    pet_shop[:pets].delete(pet)
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(cust)
  return cust[:cash]
end

def remove_customer_cash(cust, cash)
  cust[:cash] -= cash
end

def customer_pet_count(cust)
  return cust[:pets].count
end

def add_pet_to_customer(cust, new_pet)
  cust[:pets].push(new_pet)
end

# OPTIONAL

def customer_can_afford_pet(cust, new_pet)
  if cust[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, cust)
  if pet != nil
    if customer_can_afford_pet(cust, pet)
      add_pet_to_customer(cust, pet)
      increase_pets_sold(pet_shop, 1)
      remove_customer_cash(cust, pet[:price])
      add_or_remove_cash(pet_shop, pet[:price])
    end
  end
end
