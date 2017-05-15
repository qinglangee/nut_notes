# hibernate

排除不需要的字段

	import javax.persistence.Transient;

	@Transient
	Logger LOG = LoggerFactory.getLogger(PositionBean.class);

