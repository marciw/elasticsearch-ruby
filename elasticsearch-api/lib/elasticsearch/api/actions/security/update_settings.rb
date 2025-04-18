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
        # Update security index settings.
        # Update the user-configurable settings for the security internal index (+.security+ and associated indices). Only a subset of settings are allowed to be modified. This includes +index.auto_expand_replicas+ and +index.number_of_replicas+.
        # NOTE: If +index.auto_expand_replicas+ is set, +index.number_of_replicas+ will be ignored during updates.
        # If a specific index is not in use on the system and settings are provided for it, the request will be rejected.
        # This API does not yet support configuring the settings for indices before they are in use.
        #
        # @option arguments [Time] :master_timeout The period to wait for a connection to the master node.
        #  If no response is received before the timeout expires, the request fails and returns an error.
        # @option arguments [Time] :timeout The period to wait for a response.
        #  If no response is received before the timeout expires, the request fails and returns an error.
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body request body
        #
        # @see https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-security-update-settings
        #
        def update_settings(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || 'security.update_settings' }

          raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          method = Elasticsearch::API::HTTP_PUT
          path   = '_security/settings'
          params = Utils.process_params(arguments)

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end
