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
    module Esql
      module Actions
        # Delete an async ES|QL query.
        # If the query is still running, it is cancelled.
        # Otherwise, the stored results are deleted.
        # If the Elasticsearch security features are enabled, only the following users can use this API to delete a query:
        # * The authenticated user that submitted the original query request
        # * Users with the +cancel_task+ cluster privilege
        #
        # @option arguments [String] :id The unique identifier of the query.
        #  A query ID is provided in the ES|QL async query API response for a query that does not complete in the designated time.
        #  A query ID is also provided when the request was submitted with the +keep_on_completion+ parameter set to +true+. (*Required*)
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-esql-async-query-delete
        #
        def async_query_delete(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || 'esql.async_query_delete' }

          defined_params = [:id].each_with_object({}) do |variable, set_variables|
            set_variables[variable] = arguments[variable] if arguments.key?(variable)
          end
          request_opts[:defined_params] = defined_params unless defined_params.empty?

          raise ArgumentError, "Required argument 'id' missing" unless arguments[:id]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _id = arguments.delete(:id)

          method = Elasticsearch::API::HTTP_DELETE
          path   = "_query/async/#{Utils.listify(_id)}"
          params = {}

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end
