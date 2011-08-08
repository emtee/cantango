module CanTango
  module Api
    module User
      module Can
        include Ability
        # Example: generated from types of accounts! (see below)
        # def admin_can?(*args)
        #   current_ability(:admin).can?(*args)
        # end
        def self.included(base)
          puts "Can included in " << base.to_s
          puts "users:" << ::CanTango.config.users.registered.inspect

         ::CanTango.config.users.registered.each do |user|
            base.class_eval %{
              def #{user}_can? *args
                current_ability(:#{user}).can?(*args)
              end
            }
          end
        end
      end
    end
  end
end
