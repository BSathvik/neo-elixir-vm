defmodule Mixins do

  defmodule EquatableMixin do

    def equals(self, other) do
    end

  end

  defmodule InteropMixin do
  end

  defmodule ScriptTableMixin do

    def getScript(self, script_hash) do
    end

  end

  defmodule CryptoMixin do

    def hash160(self, message) do
    end

    def hash256(self, message) do
    end

    def verifySignature(self, message, signature, pubkey) do
    end

  end

end
