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
 * Recruitapply entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.shengrong.hibernate.Recruitapply
 * @author MyEclipse Persistence Tools
 */
public class RecruitapplyDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(RecruitapplyDAO.class);
	// property constants
	public static final String APPLYNAME = "applyname";
	public static final String APPLYSEX = "applysex";
	public static final String APPLYNATION = "applynation";
	public static final String APPLYNATIVE = "applynative";
	public static final String APPLYEDUCATION = "applyeducation";
	public static final String APPLYEMAIL = "applyemail";
	public static final String APPLYPHONE = "applyphone";
	public static final String APPLYRESUME = "applyresume";

	public void save(Recruitapply transientInstance) {
		log.debug("saving Recruitapply instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Recruitapply persistentInstance) {
		log.debug("deleting Recruitapply instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Recruitapply findById(java.lang.Integer id) {
		log.debug("getting Recruitapply instance with id: " + id);
		try {
			Recruitapply instance = (Recruitapply) getSession().get(
					"com.shengrong.hibernate.Recruitapply", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Recruitapply instance) {
		log.debug("finding Recruitapply instance by example");
		try {
			List results = getSession()
					.createCriteria("com.shengrong.hibernate.Recruitapply")
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
		log.debug("finding Recruitapply instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Recruitapply as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByApplyname(Object applyname) {
		return findByProperty(APPLYNAME, applyname);
	}

	public List findByApplysex(Object applysex) {
		return findByProperty(APPLYSEX, applysex);
	}

	public List findByApplynation(Object applynation) {
		return findByProperty(APPLYNATION, applynation);
	}

	public List findByApplynative(Object applynative) {
		return findByProperty(APPLYNATIVE, applynative);
	}

	public List findByApplyeducation(Object applyeducation) {
		return findByProperty(APPLYEDUCATION, applyeducation);
	}

	public List findByApplyemail(Object applyemail) {
		return findByProperty(APPLYEMAIL, applyemail);
	}

	public List findByApplyphone(Object applyphone) {
		return findByProperty(APPLYPHONE, applyphone);
	}

	public List findByApplyresume(Object applyresume) {
		return findByProperty(APPLYRESUME, applyresume);
	}

	public List findAll() {
		log.debug("finding all Recruitapply instances");
		try {
			String queryString = "from Recruitapply";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Recruitapply merge(Recruitapply detachedInstance) {
		log.debug("merging Recruitapply instance");
		try {
			Recruitapply result = (Recruitapply) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Recruitapply instance) {
		log.debug("attaching dirty Recruitapply instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Recruitapply instance) {
		log.debug("attaching clean Recruitapply instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}