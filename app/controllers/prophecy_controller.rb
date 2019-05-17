class ProphecyController < ApplicationController
  def first_page
    @requests = []
    params.keys.each do |k|
      if k =~ /^item-\d+$/ && params[k] == '1'
        @requests << params["#{k}-value"]
      end
    end
    @requests = @requests.join("\n")
  end

  def second_page
    @requests = params.require(:requests).split(/\n/).map { |r| r.gsub(/(^\s+)|(\s+$)/, '') }
    @requests.filter! { |p| p.present? }
    @requests.uniq!
  end
end
