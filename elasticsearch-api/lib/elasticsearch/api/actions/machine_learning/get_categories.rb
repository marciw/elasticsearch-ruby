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
    module MachineLearning
      module Actions
        # Get anomaly detection job results for categories.
        #
        # @option arguments [String] :job_id Identifier for the anomaly detection job. (*Required*)
        # @option arguments [String] :category_id Identifier for the category, which is unique in the job. If you specify
        #  neither the category ID nor the partition_field_value, the API returns
        #  information about all categories. If you specify only the
        #  partition_field_value, it returns information about all categories for
        #  the specified partition.
        # @option arguments [Integer] :from Skips the specified number of categories. Server default: 0.
        # @option arguments [String] :partition_field_value Only return categories for the specified partition.
        # @option arguments [Integer] :size Specifies the maximum number of categories to obtain. Server default: 100.
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body request body
        #
        # @see https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-ml-get-categories
        #
        def get_categories(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || 'ml.get_categories' }

          defined_params = [:job_id, :category_id].each_with_object({}) do |variable, set_variables|
            set_variables[variable] = arguments[variable] if arguments.key?(variable)
          end
          request_opts[:defined_params] = defined_params unless defined_params.empty?

          raise ArgumentError, "Required argument 'job_id' missing" unless arguments[:job_id]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          _job_id = arguments.delete(:job_id)

          _category_id = arguments.delete(:category_id)

          method = if body
                     Elasticsearch::API::HTTP_POST
                   else
                     Elasticsearch::API::HTTP_GET
                   end

          path   = if _job_id && _category_id
                     "_ml/anomaly_detectors/#{Utils.listify(_job_id)}/results/categories/#{Utils.listify(_category_id)}"
                   else
                     "_ml/anomaly_detectors/#{Utils.listify(_job_id)}/results/categories"
                   end
          params = Utils.process_params(arguments)

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end
