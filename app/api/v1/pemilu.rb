module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :candidates do
      desc "Return all Candidates"
      get do
        candidates = Array.new

        # Prepare conditions based on params
        valid_params = {
          party: 'party_id',
          region_category: 'region_category_id'
        }

        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]

        Candidate.includes(:party, :region_category)
          .where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do |candidate|
            candidates << {
              id: candidate.id,
              party: {
                id: candidate.party_id,
                name: candidate.party_full_name
              },
              region_category: {
                id: candidate.region_category_id,
                name: candidate.region_category_name,
                description: candidate.region_category_description
              },
              name: candidate.name,
              gender: candidate.gender,
              address: candidate.address
            }
          end

        {
          results: {
            count: candidates.count,
            total: Candidate.where(conditions).count,
            candidates: candidates
          }
        }
      end
    end

    resource :parties do
      desc "Return all Party"
      get do
        parties = Array.new

        Party.all.each do |party|
          parties << {
            id: party.id,
            name: party.name,
            full_name: party.full_name,
            chairman: party.chairman,
            secretary: party.secretary,
            treasurer: party.treasurer,
            address: party.address
          }
        end

        {
          results: {
            count: parties.count,
            total: Party.all.count,
            parties: parties
          }
        }
      end
    end

    resource :party_votes do
      desc "Return all Party Votes"
      get do
        parties = Array.new

        # Prepare conditions based on params
        valid_params = {
          party: 'party_id'
        }

        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 15 : params[:limit]

        PartyVote.includes(:party)
          .where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do |pv|
          # pv means (p)arty (v)ote
          parties << {
            id: pv.id,
            party: {
              id: pv.party_id,
              name: pv.party_full_name
            },
            value: pv.value,
            precentage: pv.precentage
          }
        end

        {
          results: {
            count: parties.count,
            total: Party.all.count,
            parties: parties
          }
        }
      end
    end

    resource :region_categories do
      desc "Return all Region Categories"
      get do
        region_categories = Array.new

        RegionCategory.all.each do |region_category|
          region_categories << {
            id: region_category.id,
            name: region_category.name,
            description: region_category.description
          }
        end

        {
          results: {
            count: region_categories.count,
            total: RegionCategory.all.count,
            region_categories: region_categories
          }
        }
      end
    end

    resource :regions do
      desc "Return all Regions"
      get do
        regions = Array.new

        # Prepare conditions based on params
        valid_params = {
          region_category: 'region_category_id'
        }

        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        Region.includes(:region_category)
          .where(conditions)
          .each do |region|
            regions << {
              id: region.id,
              region_category: {
                id: region.region_category_id,
                name: region.region_category_name,
                description: region.region_category_description
              },
              name: region.name
            }
        end

        {
          results: {
            count: regions.count,
            total: Region.where(conditions).count,
            regions: regions
          }
        }
      end
    end

    resource :dpt do
      desc "Return all DPT (Daftar Pemilih Tetap)"
      get do
        dpt = Array.new

        # Prepare conditions based on params
        valid_params = {
          region: 'region_id',
          category: 'category'
        }

        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        Dpt.includes(:region)
          .where(conditions)
          .each do |data|
            dpt << {
              id: data.id,
              region: {
                id: data.region_id,
                name: data.region_name
              },
              value: data.value,
              category: data.category
            }
        end

        {
          results: {
            count: dpt.count,
            total: Dpt.where(conditions).count,
            dpt: dpt
          }
        }
      end
    end

    resource :dct_categories do
      desc "Return all DCT Category"
      get do
        dct_categories = Array.new

        DctCategory.all.each do |category|
            dct_categories << {
              id: category.id,
              name: category.name,
              description: category.description
            }
        end

        {
          results: {
            count: dct_categories.count,
            total: DctCategory.all.count,
            dct_categories: dct_categories
          }
        }
      end
    end

    resource :dct_recapitulations do
      desc "Return all DCT Recapitulation"
      get do
        dct_recapitulations = Array.new

        # Prepare conditions based on params
        valid_params = {
          region: 'region_id',
          category: 'dct_category_id'
        }

        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        DctRecapitulation.includes(:region, :dct_category)
          .where(conditions)
          .each do |dct|
            dct_recapitulations << {
              id: dct.id,
              region: {
                id: dct.region_id,
                name: dct.region.name
              },
              category: {
                id: dct.dct_category_id,
                name: dct.dct_category.name,
                description: dct.dct_category.description
              },
              value: dct.value
            }
        end

        {
          results: {
            count: dct_recapitulations.count,
            total: DctRecapitulation.where(conditions).count,
            dct_recapitulations: dct_recapitulations
          }
        }
      end
    end
  end
end