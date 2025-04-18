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
    module XPack
      module Actions
        # Get information.
        # The information provided by the API includes:
        # * Build information including the build number and timestamp.
        # * License information about the currently installed license.
        # * Feature information for the features that are currently enabled and available under the current license.
        #
        # @option arguments [Array<String>] :categories A comma-separated list of the information categories to include in the response.
        #  For example, +build,license,features+.
        # @option arguments [Boolean] :accept_enterprise If this param is used it must be set to true
        # @option arguments [Boolean] :human Defines whether additional human-readable information is included in the response.
        #  In particular, it adds descriptions and a tag line. Server default: true.
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-info
        #
        def info(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || 'xpack.info' }

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          method = Elasticsearch::API::HTTP_GET
          path   = '_xpack'
          params = Utils.process_params(arguments)

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end
