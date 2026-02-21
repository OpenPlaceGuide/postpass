package postpass

/* config stuff
 * should go into commandline arguments
 */
const (
	Host                 = "openmaptiles_postgres_1"
	Port                 = 5432
	User                 = "readonly"
	Password             = "readonly"
	DBName               = "openmaptiles"
	QuickMediumThreshold = 150
	MediumSlowThreshold  = 150000
	ListenPort           = 8081
)
