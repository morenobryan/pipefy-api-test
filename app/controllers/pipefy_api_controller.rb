class PipefyApiController < ApplicationController
  def fetch_data
    update_organization
    update_pipes
    update_phases
    update_cards
    update_fields
    update_field_values

    redirect_to root_path
  end

  private

  def update_organization
    organization_response = Organization.create_or_update_from_remote(Organization::ORGANIZATION_ID)
    @pipes = organization_response[:pipes]
  end

  def update_pipes
    @phases = []
    @pipes.each do |pipe|
      full_pipe_response = Pipe.create_or_update_from_remote(pipe[:id])
      @phases << full_pipe_response[:phases]
    end

    @phases.flatten!
  end

  def update_phases
    @cards = []
    @phases.each do |phase|
      Phase.create_or_update_from_remote(phase[:id])
      @cards << phase[:cards]
    end

    @cards.flatten!
  end

  def update_cards
    @fields = []
    @field_values = []

    @cards.each do |card|
      card_response = Card.create_or_update_from_remote(card[:id])
      @fields << card_response[:current_phase_detail][:phase][:fields]
      @field_values << card_response[:current_phase_detail][:field_values]
    end

    @fields.flatten!
    @field_values.flatten!
  end

  def update_fields
    @fields.each do |field|
      update_type(field[:type])

      Field.create_or_update_from_remote(field[:id])
    end
  end

  def update_type(type)
    type = PipefyApi::Mapper::Type.map(type)
    type.save!
  end

  def update_field_values
    @field_values.each do |field_value|
      FieldValue.create_or_update_from_remote(field_value[:id])
    end
  end
end
