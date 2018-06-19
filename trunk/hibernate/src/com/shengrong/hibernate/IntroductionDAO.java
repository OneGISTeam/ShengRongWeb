package com.shengrong.hibernate;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Introduction entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.shengrong.hibernate.Introduction
 * @author MyEclipse Persistence Tools
 */
public class IntroductionDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(IntroductionDAO.class);
	// property constants
	public static final String CONTENT = "content";

	public void save(Introduction transientInstance) {
		log.debug("saving Introduction instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Introduction persistentInstance) {
		log.debug("deleting Introduction instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Introduction findById(java.lang.Integer id) {
		log.debug("getting Introduction instance with id: " + id);
		try {
			Introduction instance = (Introduction) getSession().get(
					"com.shengrong.hibernate.Introduction", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Introduction instance) {
		log.debug("finding Introduction instance by example");
		try {
			List results = getSession()
					.createCriteria("com.shengrong.hibernate.Introduction")
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
		log.debug("finding Introduction instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Introduction as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findAll() {
		log.debug("finding all Introduction instances");
		try {
			String queryString = "from Introduction";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	

	public Introduction merge(Introduction detachedInstance) {
		log.debug("merging Introduction instance");
		try {
			Introduction result = (Introduction) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Introduction instance) {
		log.debug("attaching dirty Introduction instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Introduction instance) {
		log.debug("attaching clean Introduction instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}


