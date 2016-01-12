module DataMapper
  module Resource
    class PersistenceState

      # a persisted/unmodified resource
      class Clean < Persisted
        def set(subject, value)
          if not_modified?(subject, value)
            self
          else
            # assign to persistence_state so that if Dirty#set calls
            # a Relationship#set, which modifies a Property, the same
            # Dirty state instance will be reused.
            state = resource.persistence_state = Dirty.new(resource)
            state.set(subject, value)
          end
        end

        def delete
          Deleted.new(resource)
        end

        def commit
          self
        end

        def rollback
          self
        end

      private

        def not_modified?(subject, value)
          subject.loaded?(resource) && subject.get!(resource).eql?(value)
        end

      end # class Clean
    end # class PersistenceState
  end # module Resource
end # module DataMapper
