# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
# This code was automatically generated from the Elasticsearch Specification
# See https://github.com/elastic/elasticsearch-specification
# See Elasticsearch::ES_SPECIFICATION_COMMIT for commit hash.
module Elasticsearch
  module API
    module Security
      module Actions
        # Clear the user cache.
        # Evict users from the user cache.
        # You can completely clear the cache or evict specific users.
        # User credentials are cached in memory on each node to avoid connecting to a remote authentication service or hitting the disk for every incoming request.
        # There are realm settings that you can use to configure the user cache.
        # For more information, refer to the documentation about controlling the user cache.
        #
        # @option arguments [String, Array<String>] :realms A comma-separated list of realms.
        #  To clear all realms, use an asterisk (+*+).
        #  It does not support other wildcard patterns. (*Required*)
        # @option arguments [Array<String>] :usernames A comma-separated list of the users to clear from the cache.
        #  If you do not specify this parameter, the API evicts all users from the user cache.
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-security-clear-cached-realms
        #
        def clear_cached_realms(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || 'security.clear_cached_realms' }

          defined_params = [:realms].each_with_object({}) do |variable, set_variables|
            set_variables[variable] = arguments[variable] if arguments.key?(variable)
          end
          request_opts[:defined_params] = defined_params unless defined_params.empty?

          raise ArgumentError, "Required argument 'realms' missing" unless arguments[:realms]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _realms = arguments.delete(:realms)

          method = Elasticsearch::API::HTTP_POST
          path   = "_security/realm/#{Utils.listify(_realms)}/_clear_cache"
          params = Utils.process_params(arguments)

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end
