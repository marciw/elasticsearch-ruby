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
        # Get service account credentials.
        # To use this API, you must have at least the +read_security+ cluster privilege (or a greater privilege such as +manage_service_account+ or +manage_security+).
        # The response includes service account tokens that were created with the create service account tokens API as well as file-backed tokens from all nodes of the cluster.
        # NOTE: For tokens backed by the +service_tokens+ file, the API collects them from all nodes of the cluster.
        # Tokens with the same name from different nodes are assumed to be the same token and are only counted once towards the total number of service tokens.
        #
        # @option arguments [String] :namespace The name of the namespace. (*Required*)
        # @option arguments [String] :service The service name. (*Required*)
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-security-get-service-credentials
        #
        def get_service_credentials(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || 'security.get_service_credentials' }

          defined_params = [:namespace, :service].each_with_object({}) do |variable, set_variables|
            set_variables[variable] = arguments[variable] if arguments.key?(variable)
          end
          request_opts[:defined_params] = defined_params unless defined_params.empty?

          raise ArgumentError, "Required argument 'namespace' missing" unless arguments[:namespace]
          raise ArgumentError, "Required argument 'service' missing" unless arguments[:service]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _namespace = arguments.delete(:namespace)

          _service = arguments.delete(:service)

          method = Elasticsearch::API::HTTP_GET
          path   = "_security/service/#{Utils.listify(_namespace)}/#{Utils.listify(_service)}/credential"
          params = {}

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end
