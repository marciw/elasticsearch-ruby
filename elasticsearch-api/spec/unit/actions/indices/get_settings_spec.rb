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

require 'spec_helper'

describe 'client.indices#get_settings' do

  let(:expected_args) do
    [
        'GET',
        url,
        {},
        nil,
        {},
        { endpoint: 'indices.get_settings' }
    ]
  end

  let(:url) do
    '_settings'
  end

  it 'performs the request' do
    expect(client_double.indices.get_settings).to be_a Elasticsearch::API::Response
  end

  context 'when an index is specified' do

    let(:url) do
      'foo/_settings'
    end

    let(:expected_args) do
      [
        'GET',
        url,
        {},
        nil,
        {},
        { defined_params: { index: 'foo' }, endpoint: 'indices.get_settings' }
      ]
    end

    it 'performs the request' do
      expect(client_double.indices.get_settings(index: 'foo')).to be_a Elasticsearch::API::Response
    end
  end

  context 'when a name is specified' do

    let(:url) do
      'foo/_settings/foo.bar'
    end

    let(:expected_args) do
      [
        'GET',
        url,
        {},
        nil,
        {},
        { defined_params: { index: 'foo', name: 'foo.bar' }, endpoint: 'indices.get_settings' }
      ]
    end

    it 'performs the request' do
      expect(client_double.indices.get_settings(index: 'foo', name: 'foo.bar')).to be_a Elasticsearch::API::Response
    end
  end

  context 'when the path must be URL-escaped' do

    let(:url) do
      'foo%5Ebar/_settings'
    end

    let(:expected_args) do
      [
        'GET',
        url,
        {},
        nil,
        {},
        { defined_params: { index: 'foo^bar' }, endpoint: 'indices.get_settings' }
      ]
    end

    it 'performs the request' do
      expect(client_double.indices.get_settings(index: 'foo^bar')).to be_a Elasticsearch::API::Response
    end
  end
end
