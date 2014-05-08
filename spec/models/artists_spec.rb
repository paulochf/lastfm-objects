require "spec_helper"
require "artists.rb"

describe Artists do
    it "should contain only passed data" do
        ### Dados simulando resposta do Last.fm
        my_artist_hash = {
            "artist" => ["Eddie Vedder", "Glen Hansard"],
            "headliner" => "Eddie Vedder",
            "chaveInexistente" => "qualquer coisa"
        }

        ### Criação do objeto e lista de parâmetros não utilizados
        a = Artists.new(my_artist_hash)
        missing_params = a.instance_variables.map {|x| x.to_s.sub('@','')} - my_artist_hash.keys

        ### Objeto deve ter...
        a.artist.should eq(my_artist_hash["artist"])
        a.artist.should include(my_artist_hash["headliner"])
        a.headliner.should eq(my_artist_hash["headliner"])

        if !missing_params.empty?
            missing_params.each {|x| a.instance_variable_get("@#{x}").should be_nil}
        end

        # Objeto não deve ter...
        a.methods.should_not include(:chaveInexistente=)
    end
end
