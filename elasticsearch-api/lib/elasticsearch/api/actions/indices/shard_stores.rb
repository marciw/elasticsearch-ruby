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
    module Indices
      module Actions
        # Get index shard stores.
        # Get store information about replica shards in one or more indices.
        # For data streams, the API retrieves store information for the stream's backing indices.
        # The index shard stores API returns the following information:
        # * The node on which each replica shard exists.
        # * The allocation ID for each replica shard.
        # * A unique ID for each replica shard.
        # * Any errors encountered while opening the shard index or from an earlier failure.
        # By default, the API returns store information only for primary shards that are unassigned or have one or more unassigned replica shards.
        #
        # @option arguments [String, Array] :index List of data streams, indices, and aliases used to limit the request.
        # @option arguments [Boolean] :allow_no_indices If false, the request returns an error if any wildcard expression, index alias, or _all
        #  value targets only missing or closed indices. This behavior applies even if the request
        #  targets other open indices.
        # @option arguments [String, Array<String>] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams,
        #  this argument determines whether wildcard expressions match hidden data streams. Server default: open.
        # @option arguments [Boolean] :ignore_unavailable If true, missing or closed indices are not included in the response.
        # @option arguments [String, Array<String>] :status List of shard health statuses used to limit the request.
        # @option arguments [Boolean] :error_trace When set to `true` Elasticsearch will include the full stack trace of errors
        #  when they occur.
        # @option arguments [String, Array<String>] :filter_path Comma-separated list of filters in dot notation which reduce the response
        #  returned by Elasticsearch.
        # @option arguments [Boolean] :human When set to `true` will return statistics in a format suitable for humans.
        #  For example `"exists_time": "1h"` for humans and
        #  `"exists_time_in_millis": 3600000` for computers. When disabled the human
        #  readable values will be omitted. This makes sense for responses being consumed
        #  only by machines.
        # @option arguments [Boolean] :pretty If set to `true` the returned JSON will be "pretty-formatted". Only use
        #  this option for debugging only.
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-indices-shard-stores
        #
        def shard_stores(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || 'indices.shard_stores' }

          defined_params = [:index].each_with_object({}) do |variable, set_variables|
            set_variables[variable] = arguments[variable] if arguments.key?(variable)
          end
          request_opts[:defined_params] = defined_params unless defined_params.empty?

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _index = arguments.delete(:index)

          method = Elasticsearch::API::HTTP_GET
          path   = if _index
                     "#{Utils.listify(_index)}/_shard_stores"
                   else
                     '_shard_stores'
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
