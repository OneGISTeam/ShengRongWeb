package com.shengrong.hibernate;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for Datum
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.shengrong.hibernate.Datum
 * @author MyEclipse Persistence Tools
 */
public class DatumDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(DatumDAO.class);
	// property constants
	public static final String TITLE = "title";
	public static final String BRIEF = "brief";
	public static final String URL = "url";
	public static final String KEYWORDS = "keywords";

	public void save(Datum transientInstance) {
		log.debug("saving Datum instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Datum persistentInstance) {
		log.debug("deleting Datum instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Datum findById(java.lang.Integer id) {
		log.debug("getting Datum instance with id: " + id);
		try {
			Datum instance = (Datum) getSession().get(
					"com.shengrong.hibernate.Datum", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Datum instance) {
		log.debug("finding Datum instance by example");
		try {
			List results = getSession()
					.createCriteria("com.shengrong.hibernate.Datum")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Datum instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Datum as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findByBrief(Object brief) {
		return findByProperty(BRIEF, brief);
	}

	public List findByUrl(Object url) {
		return findByProperty(URL, url);
	}

	public List findByKeywords(Object keywords) {
		return findByProperty(KEYWORDS, keywords);
	}

	public List findAll() {
		log.debug("finding all Datum instances");
		try {
			String queryString = "from Datum";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Datum merge(Datum detachedInstance) {
		log.debug("merging Datum instance");
		try {
			Datum result = (Datum) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Datum instance) {
		log.debug("attaching dirty Datum instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Datum instance) {
		log.debug("attaching clean Datum instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}