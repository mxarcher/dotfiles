
function unset_proxy --description '取消代理'
	set -e https_proxy
	set -e http_proxy
end
