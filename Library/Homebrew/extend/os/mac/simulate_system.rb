# typed: strict
# frozen_string_literal: true

module Homebrew
  module OS
    module MacOS
      module SimulateSystem
        sig { returns(T::Boolean) }
        def simulating_or_running_on_macos?
          Homebrew::SimulateSystem.os.blank? || [:macos,
                                                 *MacOSVersion::SYMBOLS.keys].include?(Homebrew::SimulateSystem.os)
        end

        sig { returns(Symbol) }
        def current_os
          Homebrew::SimulateSystem.os || ::MacOS.version.to_sym
        end
      end
    end
  end
end

Homebrew::SimulateSystem.singleton_class.prepend(Homebrew::OS::MacOS::SimulateSystem)
