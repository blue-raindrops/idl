class AddAdminToUsers < ActiveRecord::Migration
  def change
    User.create(name: "Administrator", email: "admin@idl.cornell.edu", password: "idladmin")
  end
end
